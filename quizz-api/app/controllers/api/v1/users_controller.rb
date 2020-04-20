class Api::V1::UsersController < ApplicationController
  before_action:cors_set_access_control_headers

  def cors_set_access_control_headers
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
      headers['Access-Control-Request-Method'] = '*'
      headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  end
    use ActionDispatch::Session::CookieStore


    require 'openssl'

def encrypt_string(str)
  cipher_salt1 = 'some-random-salt-'
  cipher_salt2 = 'another-random-salt-'
  cipher = OpenSSL::Cipher.new('AES-128-ECB').encrypt
  cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
  encrypted = cipher.update(str) + cipher.final
  encrypted.unpack('H*')[0].upcase
end

def decrypt_string(encrypted_str)
  cipher_salt1 = 'some-random-salt-'
  cipher_salt2 = 'another-random-salt-'
  cipher = OpenSSL::Cipher.new('AES-128-ECB').decrypt
  cipher.key = OpenSSL::PKCS5.pbkdf2_hmac_sha1(cipher_salt1, cipher_salt2, 20_000, cipher.key_len)
  decrypted = [encrypted_str].pack('H*').unpack('C*').pack('c*')

  cipher.update(decrypted) + cipher.final
end



    def index
    if session[:user_id]
    @current_user = User.select(:id, :username, :email).where(id: session[:user_id]).first
    @current_user_username = @current_user.username
    else
        @current_user_username = "guest"
    end
    users = User.select(:id, :username, :email);
    render json: {message: "Hello " + @current_user_username, data: users}, status: :ok
    end

    def show

        user = User.select(:id, :username, :email).where(id: params[:id])
        if user.empty?
            render json: {message: "Don't exists"}, status: 400
        else
        render json: {data: user}, status: :ok
        end
    end
    def create
        user = User.new(user_params)
        user.password = encrypt_string(params[:password])
        if user.save
            render json: {message: 'User created', data: user }, status: 201
            else
                render json: {message: 'User not created - E-mail already exists'},status: 400
            end
    end

    def destroy
        begin
        user = User.find(params[:id])
        user.destroy
        render json: {message: "Record deleted successfully"}, status: :ok
        rescue
            render json: {message: "Don't exists"}, status: 400
        end
    end
    def update
    begin
        user = User.find(params[:id])

        if user.update_attributes(user_params)
            render json: {message: "Record updated successfully"}, status: :ok
        else
            render json: {message: "Record error"}, status: 400
        end

        rescue
            render json: {message: "Don't exists"}, status: 400
        end
    end

    def login
    user = User.where(email: params[:email])

    if !user.empty?
        inputPass = params[:password]
        pass = decrypt_string(user.select(:password)[0].password)
        if inputPass == pass
                if user.first.token == nil
                    user.first.update_attributes(token: "log")
                    render json: {message: "Connection successfull !", user_id: user.first.id, user_username: user.first.username}, status: 200
                else
                    render json: {message: "Already connected ! Please log out" }, status: 200
                end

        else

            render json: {message: "Password not valid. Please Retry"}, status: 400
        end

    else
        render json: {message: "Username don't exists in database"}, status: 400
    end
    end
    def logout
        userLogged = User.where(token: "log")
        if userLogged.empty?
          render json: {message: "You're not logged in"}, status: 400
        else
          userLogged.first.update_attributes(token: nil)
          redirect_to action: "index"
        end
    end



    private

    def user_params
        params.permit(:username, :email, :password)
    end
end

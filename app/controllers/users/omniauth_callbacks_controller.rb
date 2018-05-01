class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # p request.env['omniauth.auth']
    
    service = Service.where(provider: auth.provider, uid: auth.uid).first
    #look up existing user with this facebook account
    if service.present?
      user = service.user
      service.update(
        expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token,
      )
    else
      user = User.create(
        email: auth.info.email,
        username: auth.info.name,
        password: Devise.friendly_token[0,20]
      )
      user.services.create(
        provider: auth.provider,
        uid: auth.uid,
        expires_at: Time.at(auth.credentials.expires_at),
        access_token: auth.credentials.token,
      )
    end

    sign_in_and_redirect user, event: :authentication
    set_flash_message :notice, :success, kind: "Facebook"
    # or we create a new user with this account
    #redirect_to root_path
  end

  def auth
    request.env['omniauth.auth']
  end
end

#<OmniAuth::AuthHash
# credentials=#<OmniAuth::AuthHash
# expires=true expires_at=1530288247 
# token="EAAJyk3JeDUwBABB1ZCxKifardC7gVioWq9pX9zPeSmHLO5i0cVejs3D5qiLN8OpdcDb2Lpo77nCyF9h0mOclPEqI2WqVjEcPXWYhOmVfgZAWbexAPxOA6oA5is6HaUckQFkgpiXo4UsqNhAkuUjkTAqou6xuh92VYkewO3CAZDZD"> 
# extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash 
# email="whileonrails@gmail.com" 
# id="168965477148535" 
# name="YiZhen Ko">> 
# info=#<OmniAuth::AuthHash::InfoHash email="whileonrails@gmail.com" 
# image="http://graph.facebook.com/v2.6/168965477148535/picture" 
# name="YiZhen Ko"> 
# provider="facebook" 
# uid="168965477148535">

module Msg91ruby
  class API
    attr_accessor :auth_key, :senderid
    URL = "http://control.msg91.com"
    def initialize(auth_key, senderid)
      @auth_key = auth_key
      @senderid = senderid
      @url = URL
    end

    def send(mobilenos,msg,route)
      mobile_nos = mobilenos.is_a?(Array) ? mobilenos.join(',') : mobilenos
      params = {:authkey => auth_key, :mobiles => mobile_nos, :message => msg , :sender => senderid ,:route => route, :response => "json"}
      uri = full_path('/api/sendhttp.php', params)
      response = Net::HTTP.get(uri)
    end

    def change_password(passwd, newpasswd)
      params = {:authkey => auth_key, :password => passwd, :newpass => newpasswd, :response => "json"}
      uri = full_path('/api/password.php', params)
      response = Net::HTTP.get(uri)
    end

    def balance
      params = {:authkey => auth_key, :type => 1, :response => "json"}
      uri = full_path('/api/balance.php', params)
      response = Net::HTTP.get(uri)
    end

    def full_path(path, params)
      encoded_params = URI.encode_www_form(params)
      params_string = [path, encoded_params].join("?")
      URI.parse(@url + params_string)
    end
  end
end

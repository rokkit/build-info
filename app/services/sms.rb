class Sms
  def initialize

  end

  def self.inform phone, message
      post_data = Net::HTTP.post_form URI.parse('http://smsc.ru/sys/send.php'),
       { 
         'login' => 'homeinfo',
         'psw' => 'h54fd54gfd88',
         'phones' => phone,
         'mes' => message,
         'sender' => 'Home.info',
         'charset' => 'utf-8'
       }
  end
end
def create_payment
  @endpoint = $api['payments']
  @endpoint = @endpoint.gsub("<order_id>", @orderID)

  @payment = HTTParty.post(@endpoint, 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg==',
      'Content-Type' => 'application/json'},
      body: @body)

  puts "\n\nTHE ENDPOINT CALLED AND THE BODY SENT TO CREATE A PAYMENT\n"
  puts @endpoint
  puts "\n"
  puts @body

  puts "\n\nTHE RESPONSE BODY\n"
  puts (@payment.body).force_encoding(Encoding::UTF_8)
  @getpayment = JSON.parse(@payment.body, object_class: OpenStruct)
end

def generic_payment_payload
	{
  "installmentCount" => Faker::Number.between(1, 12),
  "statementDescriptor" => (Faker::Number.between(1, 100).to_s+'1_WCC.com').to_s,
  "fundingInstrument" => @method,
  "device" => {
    "ip" => "127.0.0.1",
    "geolocation" => {
      "latitude" => Faker::Number.between(1, 999),
      "longitude" => Faker::Number.between(1, 999)
    	},
    "userAgent" => ["Mozilla/5.0", "AppleWebKit/537.36", "Chrome/58.0.3029.81", "Safari/537.36"].sample,
    "fingerprint" => "QAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolpQAZXswedCVGrtgBNHyujMKIkolp"
  	}
	}.to_json
end

def method_creditCard_payload
	{
    "method" => "CREDIT_CARD",
    "creditCard" => {
      "number" => "5555666677778884",
      "expirationMonth" => "12",
      "expirationYear" => "2022",
      "cvc" => "123",
      "store" => true,
      "holder" => {
        "fullname" => (Faker::Name.name_with_middle).to_s,
        "birthdate" => (Faker::Date.birthday(18, 65)).to_s,
        "taxDocument" => {
          "type" => "CPF",
          "number" => (Faker::Number.number(11)).to_s
        },
        "phone" => {
        	"countryCode" => "55",
        	"areaCode" => "11",
        	"number" =>(Faker::Number.number(9)).to_s
        },
        "billingAddress":{  
           "city" => (Faker::Address.city).to_s,
           "district" => (Faker::Address.community).to_s,
           "street" => (Faker::Address.street_name).to_s,
           "streetNumber" => (Faker::Address.building_number).to_s,
           "zipCode" => (Faker::Number.number(8)).to_s,
           "state" => (Faker::Address.state).to_s,
           "country" => (Faker::Address.country_code_long).to_s
        }
      }
    }
  }
end

def method_boleto_payload
	{  
	  "method" => "BOLETO",
	  "boleto" => {  
	    "expirationDate" => Faker::Date.forward(10),
	    "instructionLines" => {  
	       "first" => "Atenção,",
	       "second" => "fique atento à data de vencimento do boleto.",
	       "third" => "Pague em qualquer casa lotérica."
	    },
	    "logoUri" => "http://www.lojaexemplo.com.br/logo.jpg"
	  }
	}
end

def check_payment_status
  @check_status = HTTParty.get($api['check_payments']+@paymentID, 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg=='})

  puts "\n\nTHE ENDPOINT CALLED\n"
  puts $api['check_payments']+@paymentID

  puts "\nTHE RESPONSE BODY\n"
  puts (@check_status.body).force_encoding(Encoding::UTF_8)
  @getstatus = JSON.parse(@check_status.body, object_class: OpenStruct)
end

def change_payment_status
	@endpoint = "https://sandbox.moip.com.br/simulador/authorize?payment_id=#{@paymentID}&amount=#{@amount}"

  @change_status = HTTParty.get(@endpoint, 
    headers: {
      'Authorization' => 'Basic UTg4R0JNT1pTWVVTVEtGQ09RUldQMTFCOEZKUE9INlo6T1BQT05XTkNNRUJYRE5aS1RPWlgzTkRYNERUV1dZOUZSUk1YMUxMMg=='})
end
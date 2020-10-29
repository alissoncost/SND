Dado('que eu acesso a {string}') do |url| 
    url = DATA[url]
    p url
    visit(url)
    sleep 3
  end
  
  Quando('preencho de forma valida os campos') do
    find(EL["name"]).set FFaker::NameBR::name
    find(EL["cpf_cnpj"]).set '954.529.700-02'
    find(EL["email"]).set 'alissonteste@mailinator.com'
    find(EL["phone_number"]).set FFaker::PhoneNumberBR::mobile_phone_number
    sleep 2
  end

  Quando("Clico em avançar") do
    find(EL["entrar_chat"]).click
    
  end

  Então("vejo o chat logado") do
    page.assert_selector("#vinter-btnSendMessage", wait: 10)
  end
  
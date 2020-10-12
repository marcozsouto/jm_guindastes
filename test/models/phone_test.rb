require 'test_helper'

class PhoneTest < ActiveSupport::TestCase
  test 'should save phone with phone_number and client_id' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    assert client.save
    phone = Phone.new phone_number: '12345678', client_id: client.id
    assert phone.save
  end
  
  test 'should delete phone' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    assert client.save
    phone = Phone.new phone_number: '12345678', client_id: client.id
    assert phone.save
    assert phone.delete 
  end

  test 'should not save phone with phone_number violating format' do
    address = Address.new  street: 'Rua A', neighborhood: 'centro', number: '45', city: 'Garanhuns', zipcode: '55294123'
    address.save
    client = Client.new cpf_cnpj: '12345678901253', name:'Paulo silva', email:'paulo@gmail.com', address_id: address.id
    assert client.save
    phone = Phone.new phone_number: '1234567br', client_id: client.id
    assert_not phone.save
    
  end

end

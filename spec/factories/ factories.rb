FactoryBot.define do 
    factory :admin do 
        sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@teste.com"}
        password { "123456" }
    end

    factory :book do 
        name { "Primeiro Livro" }
        author { "Bruno Neville" }
        title { "Titulo Maneiro" }
        description { "Descricao do texto" }
    end
end
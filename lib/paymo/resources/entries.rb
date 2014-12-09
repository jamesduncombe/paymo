require './lib/builder'
module Paymo
  class Entries

    def all
      result = Paymo::API.get :entries, Paymo::Builder.new.where('user_id=26311').include(:user, :task).render
      result['entries'].map { |entry| Paymo::Entry.new(entry) } if result['entries'].any?
    rescue RestClient::BadRequest => e
      JSON.parse(e.response)
    end

    def find(id)
      result = Paymo::API.get :entries, Paymo::Builder.new.member(id).include(:user, :task).render
      Paymo::Entry.new(result['entries'].first) if result['entries'].any?
    rescue RestClient::BadRequest => e
      JSON.parse(e.response)
    end

  end
end

class Page < Hanami::Entity
  attributes do
    attribute :id,         Types::Strict::Int
    attribute :url,        Types::Strict::String
    attribute :title,      Types::String
    attribute :status,     Types::Strict::String
    attribute :created_at, Types::Strict::Time
    attribute :updated_at, Types::Strict::Time
  end
end

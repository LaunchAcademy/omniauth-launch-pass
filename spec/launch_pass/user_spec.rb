require 'spec_helper'

describe LaunchPass::User do
  let(:info_hash) do
    {
      "id"=>1,
      "first_name"=>"Dan",
      "last_name"=>"Pickett",
      "avatar_url"=>"https://secure.gravatar.com/avatar/c6aa1dc04e88732bcbea6c274f917c04.png?r=PG",
      "username"=>"dpickett",
      "email"=>"dan.pickett@launchacademy.com",
      "product_offerings"=>[
        {
          "name"=>"Introduction to Programming Alpha",
          "product"=> {"name"=>"Introduction to Programming"}
        }
      ],
      "products"=>[{"name"=>"Introduction to Programming"}],
      "teams"=>[
        {"id"=>1, "name"=>"Admins"},
        {"id"=>2, "name"=>"Online Alpha Participants"}
      ]
    }
  end

  let(:user) do
    LaunchPass::User.new(info_hash)
  end

  it 'indicates true if I am a member of a given team' do
    expect(user).to be_member_of('Admins')
  end

  it 'indicates false if I am not a member of a given team' do
    expect(user).to_not be_member_of('The Fun People')
  end

  it 'informs whether a user has access to a given product' do
    expect(user).to have_product('Introduction to Programming')
  end

  it 'informs whether a user does not have access to a given product' do
    expect(user).to_not have_product('On Premises')
  end

  it 'allows for a wildcard search against product names' do
    expect(user).to have_product('Introduction')
  end

  it 'can require an explicit match' do
    expect(user).to_not have_product('Introduction', false)
  end

  it 'has a list of team naems' do
    expect(user.teams).to eq(['Admins', 'Online Alpha Participants'])
  end

  it 'has a list of products' do
    expect(user.products).to eq(['Introduction to Programming'])
  end

  it 'has an email' do
    expect(user.email).to_not be_nil
  end

  it 'has a first name' do
    expect(user.first_name).to_not be_nil
  end

  it 'has a last name' do
    expect(user.last_name).to_not be_nil
  end

  it 'has an avatar url' do
    expect(user.avatar_url).to_not be_nil
  end

  it 'has a username' do
    expect(user.username).to_not be_nil
  end
end

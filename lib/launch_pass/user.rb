module LaunchPass
  class User
    attr_reader :email
    attr_reader :first_name
    attr_reader :last_name
    attr_reader :avatar_url
    attr_reader :username

    def initialize(info_hash)
      @info_hash = info_hash
      @email = @info_hash["email"]
      @first_name = @info_hash["first_name"]
      @last_name = @info_hash["last_name"]
      @avatar_url = @info_hash["avatar_url"]
      @username = @info_hash["username"]
    end

    def member_of?(team_name)
      teams.include?(team_name)
    end

    def has_product?(product_name, wildcard = true)
      if !wildcard
        products.include?(product_name)
      else
        products.each do |product|
          return true if product =~ /#{Regexp.escape(product_name)}/
        end
        false
      end
    end

    def admin?
      member_of?('Admins')
    end

    def teams
      if @info_hash["teams"]
        @teams ||= @info_hash["teams"].map do |team_hash|
          team_hash["name"]
        end
      end
    end

    def products
      if @info_hash["products"]
        @products ||= @info_hash["products"].map do |product|
          product["name"]
        end
      end
    end
  end
end

class CookieBag
    attr_accessor :capacity

    def initialize(capacity)
        @capacity = capacity
        @cookies = []
    end

    def add(cookie)
        if @cookies.length == @capacity
            p "No room left"
        else
            @cookies.push(cookie)
        end
    end

    def take
        if @cookies.length == 0
            p "No more cookies to take"
        else
            @cookies.pop
        end
    end

    def details
        p "This bag has #{@cookies.length} cookies, here are the details: "
        @cookies.each do |cookie|
            cookie.details
        end
    end
end



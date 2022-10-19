require './cookie.rb'
require './cookie_bag.rb'

c1 = Cookie.new(6,7)
c2 = Cookie.new(7,8)
c3 = Cookie.new(0,2)
c4 = Cookie.new(3,3)
c5 = Cookie.new(5,2)

cb = CookieBag.new(3)

cb.take #no cookies in the bag yet
cb.add c1
cb.add c2
cb.add c3
cb.details
cb.add c4
cb.add c5
cb.details

cb.take
cb.take
cb.details










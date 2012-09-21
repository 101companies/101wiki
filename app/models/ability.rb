# -*- encoding : utf-8 -*-

#
#  == Define abilities for cancan
#
#  if  role admin
#    allow everything
#  else
#    if logged in
#      cancan methods for a logged in user
#      cancan methods for special roles
#    else
#      cancan for anyone (public)
#    end
#  end
#  
class Ability

  include CanCan::Ability

end # class
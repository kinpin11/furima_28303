class DateUntilShipping < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1〜２日で発送' },
    { id: 3, name: '２〜３日で発送' },
    { id: 4, name: '4〜７日で発送' }
  
]
end

end

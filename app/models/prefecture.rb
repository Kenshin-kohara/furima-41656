class Prefecture < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' }
  ] + JpPrefecture::Prefecture.all.map { |pref|
    {
      id: pref.code,
      name: pref.name
    }
  }
end
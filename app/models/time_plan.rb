class TimePlan < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '15時〜17時' },
    { id: 3, name: '17時〜19時' },
    { id: 4, name: '19時〜21時' },
    { id: 5, name: '21時〜23時' }
  ]

  include ActiveHash::Associations
  has_many :plans
  end
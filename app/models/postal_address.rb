class PostalAddress < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :company
  # 🚅 add belongs_to associations above.

  # 🚅 add has_many associations above.

  has_one :team, through: :company
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :address_type, presence: true
  validates :street1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zipcode, presence: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  # 🚅 add methods above.
   enum address_type: { primary:'primary', billing:'billing', sales:'sales', support:'support' }
   enum state:{
     alabama:'alabama',
     alaska:'alaska',
     arizona:'arizona',
     arkansas:'arkansas',
     california:'california',
     colorado:'colorado',
     connecticut:'connecticut',
     delaware:'delaware',
     florida:'florida',
     georgia:'georgia',
     hawaii:'hawaii',
     idaho:'idaho',
     illinois:'illinois',
     indiana:'indiana',
     iowa:'iowa',
     kansas:'kansas',
     kentucky:'kentucky',
     louisiana:'louisiana',
     maine:'maine',
     maryland:'maryland',
     massachusetts:'massachusetts',
     michigan:'michigan',
     minnesota:'minnesota',
     mississippi:'mississippi',
     missouri:'missouri',
     montana:'montana',
     nebraska:'nebraska',
     nevada:'nevada',
     new_hampshire:'new_hampshire',
     new_jersey:'new_jersey',
     new_mexico:'new_mexico',
     new_york:'new_york',
     north_carolina:'north_carolina',
     north_dakota:'north_dakota',
     ohio:'ohio',
     oklahoma:'oklahoma',
     oregon:'oregon',
     pennsylvania:'pennsylvania',
     rhode_island:'rhode_island',
     south_carolina:'south_carolina',
     south_dakota:'south_dakota',
     tennessee:'tennessee',
     texas:'texas',
     utah:'utah',
     vermont:'vermont',
     virginia:'virginia',
     washington:'washington',
     west_virginia:'west_virginia',
     wisconsin:'wisconsin',
     wyoming:'wyoming',
   }


end

require 'rails_helper'

RSpec.describe Plot, type: :model do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:plant_plots) }
    it { should have_many(:plants).through(:plant_plots) }
  end
end
    #unsure why I am getting this error. 30 minutes lost >.<
     # NoMethodError:
     #   undefined method `klass' for nil:NilClass
     # # ./spec/models/plot_spec.rb:7:in `block (3 levels) in <top (required)>'
     # # ------------------
     # # --- Caused by: ---
     # # NoMethodError:
     # #   undefined method `klass' for nil:NilClass
     #   ./spec/models/plot_spec.rb:7:in `block (3 levels) in <top (required)>'

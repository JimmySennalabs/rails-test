class Article < ApplicationRecord
    def activate
      self.update(activated: true)
    end
    def deactivate
      self.update(activated: false)
    end
  end
module BracketService
  module BracketHelper
    def bracket_class_name
      "BracketTree::Bracket::#{@tournament.bracket_type}"
    end
  end
end

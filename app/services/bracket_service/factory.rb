module BracketService
  class Factory
    def self.create_bracket(type, size)
      case type
      when
      'DoubleElimination'
        BracketTree::Bracket::DoubleElimination.by_size size
      when
      'SingleElimination'
        BracketTree::Bracket::SingleElimination.by_size size
      end
    end
  end
end

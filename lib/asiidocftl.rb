require 'asciidoctor'
require 'asciidoctor/extensions'

class GradeBlock < Asciidoctor::Extensions::BlockProcessor
  PeriodRx = /\.(?= |$)/

  use_dsl

  named :shout
  on_context :paragraph
  name_positional_attributes 'vol'
  parse_content_as :simple

  def process parent, reader, attrs
    volume = ((attrs.delete 'vol') || 1).to_i
    create_paragraph parent, (reader.lines.map {|l| l.upcase.gsub PeriodRx, '!' * volume }), attrs
  end
end

class SolveBlock < Asciidoctor::Extensions::BlockProcessor
  PeriodRx = /\.(?= |$)/

  use_dsl

  named :shout
  on_context :paragraph
  name_positional_attributes 'vol'
  parse_content_as :simple

  def process parent, reader, attrs
    volume = ((attrs.delete 'vol') || 1).to_i
    create_paragraph parent, (reader.lines.map {|l| l.upcase.gsub PeriodRx, '!' * volume }), attrs
  end
end



require 'nokogiri'
require 'open-uri'

class SearchController < ApplicationController
  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
    p current_user
    p session[:user_id]
  end

  def create 
    @h = Hash.new{|hsh, key| hsh[key] = []}

    @doc = Nokogiri::HTML(open(whole_search))
    @doc.xpath('//h3/a').each do |node|
      lead = node.text.split(/(?=-)/)
      @h[:name] << lead[0]
      @h[:job] << lead[1]
    end

    @doc.xpath('//h3/a/@href').each do |node|
      url = node.text[7..-1]
      final_url = url.slice(0..(url.index('&')))
      @h[:url] << final_url.chomp('&')
    end
    render :show
  end

  def show 
    
  end

  private

  def whole_search
    google_url = %Q(http://www.google.com/search?q=")
    @company_name = params[:search]
    # @request = %Q(#{google_url}"#{company_name}"+%2B+"HR"+OR+"RH"+OR+"DRH"+OR+"RESPONSABLE+RESSOURCES+HUMAINES"+%2B+Paris+%2B+site%3Alinkedin.com%2Fin)
    @request = %Q(#{google_url}#{@company_name.gsub!(/\s/,'+')}"+%2B+"CEO"+OR+"Fondateur"+OR+"Founder"+OR+"Co+fondateur"+%2B+Paris+%2B+site%3Alinkedin.com%2Fin)
    return @request
  end
end

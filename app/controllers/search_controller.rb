require 'nokogiri'
require 'open-uri'

class SearchController < ApplicationController
  def index

  end

  def new
    @lead = LeadSearch.new
  end

  def create 
    scrap 
    render :show
  end 

  private

  def scrap
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
  end


  def whole_search
    google_url = %Q(http://www.google.com/search?q=)
    @company_name = params[:search]
    @request = %Q(#{google_url}#{@company_name}"+%2B+"CEO"+OR+"Fondateur"+OR+"Fondatrice"+OR+"DG"+OR+"PDG"+%2B+Paris+site%3Alinkedin.com%2Fin)
    return @request
  end
end

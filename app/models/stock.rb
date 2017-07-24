class Stock < ActiveRecord::Base
  
  def self.find_by_ticker(ticker_symbol)
    where(ticker: ticker_symbol).first
  end
  
  def self.new_from_lookup(ticker_symbol)
    # busca toda la informacion del stock
    looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
    return nil unless looked_up_stock.name
    
    new_stock = new(ticker: looked_up_stock.symbol, name: looked_up_stock.name)
    new_stock.last_price = new_stock.price
    new_stock
  end
  
  def price
    closing_price = StockQuote::Stock.quote(ticker).close
    return "#{closing_price} (Cerrando)" if closing_price
    
    opening_price = StockQuote::Stock.quote(ticker).open
    return "#{opening_price} (Abriendo)" if opening_price
    # es un sino
    'No disponible'
  end
  
end

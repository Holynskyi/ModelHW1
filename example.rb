  def sum
    @price_sum=0
    (Product.all).each do |t|
      @price_sum += t.price
    end
    return @price_sum
  end

  def averedge
    @averedge_price = (self.sum)/(Product.all).length
  end

  def extremums
    @temp = Product.order(price: :desc)
    @max = @temp[0]
    @min = @temp[-1]
  end

  def onlyTV
    @TVinclude = Product.where(name:'TV')
  end

  def cheap
    @cheap = Array.new
    @cheap = Product.where('price<?',100)
  end
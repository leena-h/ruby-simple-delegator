require 'Date'

class TaxInvoice
  attr_accessor :name, :invoice_total

  def initialize(name, invoice_total)
    @name = name
    @invoice_total = invoice_total
  end

  def abn
    '32 123 456 789'
  end

  def invoice_date
    Date.new(2017, 4, 10)
  end
end

class TaxInvoiceDecorator < SimpleDelegator
  def invoice_month
    invoice_date.strftime("%B")
  end

  def last_name
    name.split.last
  end

  def formatted_invoice_total
    "$#{invoice_total}"
  end
end

tax_invoice = TaxInvoice.new('Tom Hanks', 10)
tax_invoice_decorator = TaxInvoiceDecorator.new(tax_invoice)

puts tax_invoice_decorator.last_name
puts tax_invoice_decorator.invoice_month
puts tax_invoice_decorator.formatted_invoice_total

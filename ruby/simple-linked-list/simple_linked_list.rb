class Element
  attr_accessor :datum, :next
  def initialize(value)
    @datum = value
    @next = nil
  end
end

class SimpleLinkedList
    def initialize(array=[])
      @head = nil
      array.each { |e| push(Element(e)) }
    end
    def to_a
      return [] unless @head
      el, out = @head, [@head.datum]
      while el.next
        el = el.next
        out << el.datum
      end
      out
    end
    def push(element)
      element.next = @head if @head
      @head = element
      self
    end
    def pop
      return nil unless @head
      @head = element.next
      self
    end
    def reverse!
      cur = @head
      while cur.next
        prev = cur.next
        nxt.next = el
      end
      self
    end
    def ==(rhs)
      rhs and self.to_a == rhs.to_a
    end
end

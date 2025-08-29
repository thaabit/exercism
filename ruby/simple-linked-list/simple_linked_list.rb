class Element
  attr_accessor :datum, :next
  def initialize(value)
    @datum = value
    @next = nil
  end
end

class SimpleLinkedList
    def initialize(array=[])
      @tail = nil
      array.each { |e| push(Element(e)) }
    end
    def to_a
      return [] unless @tail
      el, out = @tail, [@tail.datum]
      while el.next
        el = el.next
        out << el.datum
      end
      out
    end
    def push(element)
      element.next = @tail if @tail
      @tail = element
      self
    end
    def pop
      return nil unless @tail
      @tail = element.next
      self
    end
    def reverse!
      cur = @tail.next
      prev = @tail
      until cur.nil?
        tmp = cur.next
        cur.next = prev
        prev = cur
        cur = tmp
      end
      @tail = prev
    end
    def ==(rhs)
      rhs and self.to_a == rhs.to_a
    end
end

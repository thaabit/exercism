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
      array.each { |e| push(Element.new(e)) }
    end

    def to_a
      el, out = @tail, []
      until el.nil?
        out << el.datum
        el = el.next
      end
      return out
    end

    def push(element)
      element.next = @tail if @tail
      @tail = element
      return self
    end

    def pop
      el = @tail
      @tail = @tail.next if @tail
      return el
    end

    def reverse!
      prev = @tail or return self
      cur = @tail.next
      @tail.next = nil
      until cur.nil?
        tmp = cur.next
        cur.next = prev
        prev = cur
        cur = tmp
      end
      @tail = prev
      return self
    end

    def ==(rhs)
      rhs and self.to_a == rhs.to_a
    end
end

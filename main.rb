class Node
  attr_accessor :value, :next_node

  @@count = 0

  def initialize(value=nil)
    @@count += 1

    @value = value
    @next_node = nil
  end

  def self.count
    @@count
  end

end

class LinkedList

  def initialize
    @head = nil
    @tail = nil
  end

  def prepend(value)
    node = Node.new(value)
    if @head.nil?
      @tail = node
    else
      node.next_node = @head
    end
    @head = node
  end

  def append(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def size
    Node.count
  end

  def head
    @head.value
  end

  def tail
    @tail.value
  end

  def at(index)
    pos = @head
    if index < Node.count
      index.times do
        pos = pos.next_node
      end
      pos
    else
      "No node is found at the given index"
    end
  end

  def pop
    if @tail.nil?
      puts "There is nothing to delete"
    else
      current_node = @head.next_node

      until current_node == nil || current_node.value.equal?(self.at(size-1).value)
        previous_node = current_node
        current_node = current_node.next_node
      end
      previous_node.next_node = current_node.next_node
      @tail = previous_node
    end
    current_node.value
  end

  def to_s
    temp = @head
    output = ""
    while temp != nil
      output += "( #{temp.value} ) -> "
      temp = temp.next_node
    end
    output += "nil"
    output
  end

  def contains?(value)
    if @tail.nil?
      puts "The list does not contain any values"
    else
      n = 0
      output = false
      while n < (self.size - 1)
        output = true if self.at(n).value == value
        n += 1
      end
      output
    end
  end

  def find(value)
    if @tail.nil?
      puts "The list does not contain any values"
    else
      n = 0
      while n < (self.size - 1)
        return n if self.at(n).value == value
        n += 1
      end
      return nil
    end
  end

  def insert_at(value, index)
    previous_node = self.at(index-1)
    new_node = Node.new(value)

    new_node.next_node = previous_node.next_node
    previous_node.next_node = new_node
  end

  def remove_at(index)
    output = self.at(index)
    previous_node = self.at(index-1)
    new_next_node = self.at(index+1)

    previous_node.next_node = new_next_node

    output
  end

end

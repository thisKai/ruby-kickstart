# Print to stdout, each element in a hash based linked list, in reverse.
# If you don't know what that is, go check out the previous problem.
#
# EXAMPLES:
# head = {:data => 1, :next => nil}
# head = {:data => 2, :next => head}
#
# print_list_in_reverse head   # >> "1\n2\n"

def print_list_in_reverse(linked_list)
  head = linked_list
  list_items = []

  until head.nil?
    list_items << head[:data]
    head = head[:next]
  end

  puts list_items.reverse
end

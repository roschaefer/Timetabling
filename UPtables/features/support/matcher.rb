RSpec::Matchers.define :allocate_rooms_like do |room_allocation_column|
  match do |sorted_timetable_presenter|
    text_arrays = replace_course_id_with_index(sorted_timetable_presenter.map(&:text_array))
    first, *rest = text_arrays

    actual = first.zip(*rest).collect{|e| e.join(" ").squish}
    expected = room_allocation_column.map(&:squish)

    expect(actual).to eq expected
  end


  private
  def replace_course_id_with_index(text_arrays)
    # we replace the encoded course id with the index number of the sorted solutions
    result = []
    text_arrays.each_with_index do |ta, i|
      # remap course id to solution id, quite ugly!
      result << ta.collect {|e| (e == "1") ? (i+1) : e} # assuming we have only one course with id "1"
    end
    result
  end
end

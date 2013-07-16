require 'spec_helper'

describe Umruhren do
  it 'creates rand_string of specified length' do
    subject::CHARS.should_receive(:sample).exactly(4).times.and_return('H')
    subject.send(:rand_string, 4).should == 'HHHH'
  end

  it 'creates rand_string_array of specified size' do
    subject.should_receive(:rand_string).and_return '1234'
    subject.should_receive(:rand_string).and_return 'abcd'
    subject.send(:rand_string_array, 2).should == ['1234', 'abcd']
  end

  it 'renames files in specified dir with selected extension' do
    Dir.should_receive(:[]).with('/path/to/dir/*.ext').and_return %w(/path/to/dir/one.ext /path/to/dir/two.ext /path/to/dir/three.ext)
    subject.should_receive(:rand_string_array).with(3).and_return %w(f1 f2 f3)
    File.should_receive(:rename).with('/path/to/dir/one.ext', '/path/to/dir/f1.ext')
    File.should_receive(:rename).with('/path/to/dir/two.ext', '/path/to/dir/f2.ext')
    File.should_receive(:rename).with('/path/to/dir/three.ext', '/path/to/dir/f3.ext')
    subject.rename_files('/path/to/dir', 'ext')
  end
end

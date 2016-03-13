task check: :environment do
  options = [*'a'..'z', *'A'..'Z', *0..9]
  array = []

  1_000_000.times do
    array << options.sample(8)
  end

  puts array.uniq.length
end
require "byebug"

def all_words_capitalized?(arr)

    arr.all? { |word| word.capitalize == word}

end

def no_valid_url?(urls)

    no_valid = ['.com', '.net', '.io','.org']

    # first try: urls.none? { |url| no_valid.include? (url[url.index(".")..-1])}

    urls.none? do |url|
        no_valid.any? { |ending| url.end_with?(ending)}
    end


end

def any_passing_students?(stds)

    stds.any? { |std| std[:grades].sum / std[:grades].length >=75}

end
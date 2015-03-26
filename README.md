Downloads and parses the footnotes from the FCC's most recent Open Internet Order.

You can run the script yourself or you can just view the footnotes as JSON [here](https://gist.githubusercontent.com/adelevie/fb1128b0b7e80ed1abf3/raw/ec2f82fc0c0569abadb818e5c9771efb7bb42223/open-internet-footnotes.json).

## Usage

```
bundle
ruby parse.rb
```

`parse.rb` will download and unzip the Order if it hasn't already been downloaded.

## How?

The secret is that Word docs store footnotes in a file appropriately called `footnotes.xml`. It's in the `word` folder.

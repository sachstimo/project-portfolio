# Google Maps Review Analyzer

This project analyzes Google Maps reviews for a given place. It fetches reviews, analyzes them for sentiment and word frequency, and generates a word cloud.

## Features

- `get_place_id`: Fetches the Place ID using Google Places API.
- `get_reviews`: Fetches reviews for the given Place ID.
- `analyze_reviews`: Analyzes reviews for sentiment and word frequency.
- `create_wordcloud`: Creates a word cloud from word frequencies.

## Setup

### Prerequisites

- Python 3.x
- Jupyter Notebook
- Google Places API Key

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/your-repo/google-maps-review-analyzer.git
    cd google-maps-review-analyzer
    ```

2. Install the required Python packages:
    ```sh
    pip install requests textblob wordcloud matplotlib
    ```

3. Set up your Google Places API Key:
    - Follow the instructions to get an API key from the [Google Places API documentation](https://developers.google.com/maps/documentation/places/web-service/get-api-key).
    - Replace `"Your Google API Key"` in the notebook with your actual API key.

## Usage

1. Open the Jupyter Notebook:
    ```sh
    jupyter notebook review-analyzer.ipynb
    ```

2. Run the notebook cells sequentially to:
    - Fetch the Place ID for a given place name.
    - Fetch reviews for the Place ID.
    - Analyze the reviews for sentiment and word frequency.
    - Generate a word cloud from the word frequencies.

## Example

```python
place_name = "Kiltro Restobar Barcelona Gracia"

place_id = get_place_id(place_name)
reviews = get_reviews(place_id, review_sort="most_relevant", verbose=False)

if reviews:
    sentiments, word_counts = analyze_reviews(reviews)

    print(f"Average Sentiment: {sum(sentiments)/len(sentiments):.2f}")
    print(f"Positive Reviews: {sum(1 for s in sentiments if s > 0)}")
    print(f"Negative Reviews: {sum(1 for s in sentiments if s < 0)}")
    
    create_wordcloud(word_counts)
else:
    print("No reviews found.")
```

## Acknowledgments

- [Google Places API](https://developers.google.com/maps/documentation/places/web-service/overview)
- [TextBlob](https://textblob.readthedocs.io/en/dev/)
- [WordCloud](https://github.com/amueller/word_cloud)
- [Matplotlib](https://matplotlib.org/)

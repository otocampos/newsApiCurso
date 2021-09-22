class endPoints {
  static String BASE_URL = 'newsapi.org';
  static String PARAM_TOP_HEADLINES = '/v2/top-headlines';
  static String PARAM_COUNTRY = 'country';
  static String COUNTRY_BR = 'br';
  static String COUNTRY_US = 'us';
  static String PARAM_API_KEY = 'apiKey';
  static String API_KEY = '9f1c23c070554d07a7ca33ee02890591';

  static String URL_ENDPOINT_HEADLINES_ALL_CATEGORIES =
      '${BASE_URL}${PARAM_TOP_HEADLINES}?${PARAM_COUNTRY}=${COUNTRY_BR}&${PARAM_API_KEY}=${API_KEY}';

  static var URL_ENDPOINT_HEADLINES_ALL = Uri.https(BASE_URL,
      PARAM_TOP_HEADLINES, {PARAM_COUNTRY: COUNTRY_BR, PARAM_API_KEY: API_KEY});
}

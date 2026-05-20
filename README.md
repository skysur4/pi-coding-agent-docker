# ai
AI 관련 지식

| API                                | 특징                                                                        | 무료 한도                            | 주의점                                            |
| ---------------------------------- | ------------------------------------------------------------------------- | -------------------------------- | ---------------------------------------------- |
| DuckDuckGo Instant Answer API      | 공개된 “Instant Answer” 엔드포인트 (https://api.duckduckgo.com/?q=…&format=json). | 1000 요청/일 (제한 없음)                | 검색 결과가 제한적이며, 정형화된 “Instant Answer” 형태에 한정됩니다. |
| Bing Search v7 (Microsoft Azure)   | Bing 웹, 이미지, 뉴스 등 검색.                                                     | 1000 요청/월 (Bing Search v7 프리 티어) | Azure 포털에서 API 키 발급 필요, 사용량 초과 시 비용 발생.        |
| SerpAPI                            | Google, Bing, Baidu 등 다양한 엔진을 지원.                                         | 100 검색/월 (프리 티어)                 | 스크래핑 기반이므로 사용량 초과 시 요금 부과.                     |
| Openverse (formerly OpenAI Search) | 학술 논문, 책, 이미지 등.                                                          | 제한 없음(정책에 따라)                    | 특정 도메인에 한정, 대규모 요청 시 비용이 발생할 수 있음.             |
| Google Custom Search JSON API      | Google 검색 결과를 JSON으로 제공.                                                  | 100 요청/일 (무료)                    | cx(검색 엔진 ID)와 API 키 필요.                        |
| The New York Times Article Search  | 기사 검색에 특화.                                                                | 10,000 요청/월 (무료)                 | API 키 필요.                                      |
| Wikipedia REST API                 | 위키피디아 검색 및 내용 조회.                                                         | 무제한(정책 준수)                       | 크롤링이 아닌 공식 API 사용.                             |

| 상황                                | 추천                                                |
| --------------------------------- | ------------------------------------------------- |
| 간단한 키워드 검색 (예: “최근 뉴스”, “트렌딩 주제”) | DuckDuckGo Instant Answer 또는 Google Custom Search |
| 이미지/동영상 등 시각적 자료                  | Bing Search v7 (프리 티어)                            |
| 다양한 검색 엔진을 한 번에                   | SerpAPI (프리 티어)                                   |
| 학술/논문 검색                          | Openverse, arXiv API 등                            |
| 위키피디아 내용 바로 조회                    | Wikipedia REST API                                |

```javascript
// DuckDuckGo Instant Answer 예시
const fetch = require('node-fetch');

async function ddgSearch(query) {
  const url = `https://api.duckduckgo.com/?q=${encodeURIComponent(query)}&format=json`;
  const res = await fetch(url);
  return res.json();
}

ddgSearch('인공지능').then(console.log).catch(console.error);
```

```javascript
// Google Custom Search 예시 (node-fetch 사용)
const fetch = require('node-fetch');

async function googleSearch(query) {
  const apiKey = 'YOUR_GOOGLE_API_KEY';
  const cx = 'YOUR_SEARCH_ENGINE_ID';
  const url = `https://www.googleapis.com/customsearch/v1?key=${apiKey}&cx=${cx}&q=${encodeURIComponent(query)}`;
  const res = await fetch(url);
  return res.json();
}

googleSearch('가장 좋은 Node.js 프레임워크').then(console.log).catch(console.error);
```

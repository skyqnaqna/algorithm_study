/*----------------
|프로그래머스 H-Index
|21.02.03
-----------------*/
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

int solution(vector<int> citations) {
    int answer = 0;
    sort(citations.begin(), citations.end(), greater());

    if (citations[0] == 0) return 0;

    for (int i = 0; i < citations.size(); ++i)
    {
        if (citations[i] >= i + 1) answer = max(answer, i + 1);
    }

    return answer;
}

int main()
{
    vector <int> v {5, 5, 5, 5};

    printf("%d\n", solution(v));

    return 0;
}
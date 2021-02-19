// 프로그래머스 카펫
// 21.02.18
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#define INF 2147000000

typedef long long ll;

using namespace std;

int main()
{

    return 0;
}

vector<int> solution(int brown, int yellow) {
    vector<int> answer;
    int x = brown + yellow;
    for (int i = x; i > 2; --i)
    {
        if (x % i == 0 && (i - 2)*(x / i - 2) == yellow)
        {
            answer.push_back(i);
            answer.push_back(x/i);
            break;
        }
    }
    return answer;
}
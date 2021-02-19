// 프로그래머스 소수 찾기
// 21.02.11
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

bool isNotPrime[10000000] = { false };
set <int> numSet;
bool check[10] = { false };
string s = "";

void permutations(int cnt, int r, string num)
{
    if (cnt == r)
    {
        numSet.insert(stoi(s));

        return;
    }

    for (int i = 0; i < num.length(); ++i)
    {
        if (!check[i])
        {
            check[i] = true;
            s += num[i];
            permutations(cnt + 1, r, num);
            s = s.substr(0, s.size() - 1);
            check[i] = false;
        }
    }
}

int solution(string numbers)
{
    int answer = 0;
    // 소수 구하기
    isNotPrime[0] = true; isNotPrime[1] = true;
    for (int i = 2; i < int(sqrt(9999999)) + 1; ++i)
    {
        if (!isNotPrime[i])
        {
            for (int j = 2; i*j < 9999999; ++j)
            {
                isNotPrime[i * j] = true;
            }
        }
    }

    for (int i = 1; i <= numbers.length(); ++i)
    {
        permutations(0, i, numbers);
    }

    for (auto &n : numSet)
    {
        if (!isNotPrime[n]) ++answer;
    }

    return answer;
}

int main()
{
    string a = "011";
    cout << solution(a) << "\n";

    for (int i = 0; i < 10; ++i)
        cout << isNotPrime[i] << " ";

    return 0;
}
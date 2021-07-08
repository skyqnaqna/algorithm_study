/*
 백준 11653 소인수분해
 21.07.08
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

bool isNotPrime[4000];

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    int n; cin >> n;

    if (n == 1) {
        return 0;
    }

    vector<int>prime;
    for (int i = 2; i < sqrt(10000000); ++i) {
        if (isNotPrime[i]) continue;
        for (int j = i + i; j < sqrt(10000000); j += i) {
            isNotPrime[j] = true;
        }
        prime.push_back(i);
    }

    int idx = 0;
    while (n != 1 && idx < prime.size()) {
        while (n % prime[idx] == 0 && n != 1) {
            n /= prime[idx];
            cout << prime[idx] << endl;
        }
        ++idx;
    }

    // 더 큰 소수일 경우
    if (n > 1) cout << n << endl;

    return 0;
}

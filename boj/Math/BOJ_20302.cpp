/*
 21.10.29
 백준 20302 민트 초코
 https://github.com/skyqnaqna/algorithm_study
 */

#include <bits/stdc++.h>

using namespace std;
using ll = long long;
using dd = double;
using pii = pair<int, int>;
using pll = pair<ll, ll>;

#define INF (ll)2e12
#define endl "\n"

void input() {
    freopen("input.txt", "r", stdin);
}

int n, prime[100001];
bool numerator;

void factorization(int num) {
    int end = (int)sqrt(num) + 1;
    int x = num;

    for (int i = 2; i <= end; ++i) {
        while (x % i == 0) {
            x /= i;

            if (numerator)  ++prime[i];
            else --prime[i];
        }
    }

    if (x > 1) {
        if (numerator) ++prime[x];
        else --prime[x];
    }
}

int main() {
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    numerator = true;
    bool zero = false;
    for (int i = 0; i < 2 * n - 1; ++i) {
        if (i % 2 == 0) {
            int x; cin >> x;
            if (x == 0) {
                zero = true;
                continue;
            }

            factorization(abs(x));
        } else {
            string s; cin >> s;

            numerator = s == "*";
        }
    }

    if (zero) {
        cout << "mint chocolate\n";
        return 0;
    }

    for (auto &res : prime) {
        if (res < 0) {
            cout << "toothpaste\n";
            return 0;
        }
    }

    cout << "mint chocolate\n";

    return 0;
}
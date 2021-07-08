/*
 백준 1735 분수 합
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

int a, b, c, d;

int gcd(int a, int b) {
    if (b == 0) return a;
    else return gcd(b, a % b);
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> a >> b >> c >> d;
//    cin >> c >> d;

    int bd = b * d;
    int ac = a * d + b * c;

    int g = gcd(ac, bd);

    cout << ac / g << " " <<  bd / g << endl;

    return 0;
}

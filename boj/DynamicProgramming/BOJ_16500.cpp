// 백준 16500 문자열 판별
// 21.02.22
#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 2147000000
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int ,int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

int d[101] = { 0 };
string s;
vector <string> words;
int n;

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(nullptr); cout.tie(nullptr);

    cin >> s;
    cin >> n;


    for (int i = 0; i < n; ++i)
    {
        string a; cin >> a;
        words.push_back(a);
    }

    d[s.length()] = 1;

    for (int i = s.length() - 1; i >= 0; --i)
    {
        for (int j = 0; j < n; ++j)
        {
            if (s.find(words[j], i) == i && d[i + words[j].length()])
            {
                d[i] = 1;
                break;
            }
        }
    }

    cout << d[0] << endl;

    return 0;
}
/*----------------------
|백준 1316 그룹 단어 체커
|21.01.31
----------------------*/

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#define INF 2147000000

using namespace std;

bool alpha[30] = { false };

int main()
{
    ios_base::sync_with_stdio(false); cin.tie(NULL);
    int n; cin >> n;

    int cnt = 0;
    while (n)
    {
        --n;
        bool ans = true;
        fill(alpha, alpha + 30, false);

        string s; cin >> s;

        alpha[s[0] - 'a'] = true;
        for (int i = 1; i < s.length(); ++i)
        {
            if (alpha[s[i] - 'a'] && s[i] != s[i-1])
            {
                ans = false;
                break;
            }
            else alpha[s[i] - 'a'] = true;
        }

        if (ans) ++cnt;

    }

    cout << cnt << "\n";

    return 0;
}
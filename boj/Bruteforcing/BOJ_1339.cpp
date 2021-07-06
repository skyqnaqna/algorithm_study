/*
 백준 1339 단어 수학
 21.07.06
 https://github.com/skyqnaqna/algorithm_study/
*/

#include <bits/stdc++.h>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

vector<string>words;

int n, m = 0, answer = 0;
int setNum[26];
bool exist[26];

int toNum(string a) {
    int res = setNum[a[0] - 'A'];

    for (int i = 1; i < a.length(); ++i) {
        res *= 10;
        res += setNum[a[i] - 'A'];
    }

    return res;
}

void getSolution(int idx, int num, int cnt) {
    if (cnt == m || idx == 26) {
        int tempSum = 0;
        for (int i = 0; i < words.size(); ++i) {
            tempSum += toNum(words[i]);
        }

        if (answer < tempSum) answer = tempSum;
    }

    for (int i = 0; i < 26; ++i) {
        if (exist[i] && setNum[i] == -1) {
            setNum[i] = num;
            getSolution(i, num - 1, cnt + 1);
            setNum[i] = -1;
        }
    }

}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);

    cin >> n;

    for (int i = 0; i < n; ++i) {
        string s;
        cin >> s;
        words.push_back(s);

        for (int j = 0; j < s.length(); ++j) {
            if (!exist[s[j] - 'A']) {
                exist[s[j] - 'A'] = true;
                m++;
            }
        }
    }

    fill(setNum, setNum + 26, -1);
    for (int i = 0; i < 26; ++i) {
        if (exist[i]) {
            setNum[i] = 9;
            getSolution(i, 8, 1);
            setNum[i] = -1;
        }
    }

    cout << answer << endl;

    return 0;
}
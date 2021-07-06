/*
 백준 1759 암호 만들기
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

char vowels[5] = {'a', 'e', 'i', 'o', 'u'};
vector <char> alphabets;
bool visited[15];
int l, c;

bool checkWord(string s) {
    int vowel_num = 0;
    int others = s.length();

    for (int i = 0; i < s.length(); ++i) {
        for (int j = 0; j < 5; ++j) {
            if (s[i] == vowels[j]) {
                vowel_num++;
                others--;
                break;
            }
        }
    }

    if (vowel_num > 0 && others > 1) return true;
    else return false;
}

void getCode(int idx, int cnt) {
    if (cnt == l) {
        string s;
        for (int i = 0; i < c; ++i) {
            if (visited[i]) {
                s += alphabets[i];
            }
        }
        if (checkWord(s)) cout << s << endl;
    }

    for (int i = idx; i < c; ++i) {
        if (!visited[i]) {
            visited[i] = true;
            getCode(i, cnt + 1);
            visited[i] = false;
        }
    }
}


int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    cin >> l >> c;

    for (int i = 0; i < c; ++i) {
        char ch; cin >> ch;
        alphabets.push_back(ch);
    }

    sort(alphabets.begin(), alphabets.end());

    getCode(0, 0);

    return 0;
}
/*
 백준 1406 에디터
 21.07.02
 https://github.com/skyqnaqna/algorithm_study
 */

#include <iostream>
#include <algorithm>
#include <queue>
#include <vector>
#include <string>
#include <cmath>
#include <set>
#include <stack>

#define INF 1e9
#define endl "\n"

typedef long long ll;
typedef double dd;
typedef std::pair<int, int> pii;
typedef std::pair<ll, ll> pll;

using namespace std;

const int MAX = 600001;
char dat[MAX];
int pre[MAX];
int nxt[MAX];
int cursor, unused;

int left(int now)
{
    if (now != 0) return pre[now];
    else return 0;
}

int right(int now)
{
    if (nxt[now] != -1) return nxt[now];
    else return now;
}

int erase(int now)
{
    if (now == 0) return 0;
    if (nxt[now] != -1) pre[nxt[now]] = pre[now];

    nxt[pre[now]] = nxt[now];

    return pre[now];
}

int insert(int now, int idx, char x)
{
    dat[idx] = x;
    pre[idx] = now;
    nxt[idx] = nxt[now];

    if (nxt[now] != -1) pre[nxt[now]] = idx;

    nxt[now] = idx;
    unused++;

    return idx;
}

int main()
{
    ios::sync_with_stdio(0); cin.tie(0);
    fill(pre, pre + MAX, -1);
    fill(nxt, nxt + MAX, -1);

    string init; cin >> init;
    int m; cin >> m;

    for (int i = 1; i <= init.length(); ++i)
    {
        dat[i] = init[i - 1];
        pre[i] = i - 1;
        nxt[i - 1] = i;
    }

    cursor = init.length();
    unused = cursor + 1;

    while (m--)
    {
        char c; cin >> c;

        if (c == 'L') cursor = left(cursor);
        else if (c == 'D') cursor = right(cursor);
        else if (c == 'B') cursor = erase(cursor);
        else {
            char ch; cin >> ch;
            cursor = insert(cursor, unused, ch);
        }
    }

    string answer = "";
    cursor = nxt[0];

    while (cursor != -1) {
        answer += dat[cursor];
        cursor = nxt[cursor];
    }

    cout << answer;

    return 0;
}

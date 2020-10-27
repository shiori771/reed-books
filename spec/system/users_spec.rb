require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end
  context 'ユーザー新規登録ができること' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('SIGN UP')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'Name', with: @user.name
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      fill_in 'Password confirmation', with: @user.password_confirmation
      fill_in 'Profile', with: @user.profile
      # サインアップボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # トップページへ遷移する
      expect(current_path).to eq root_path
      # ログアウトボタンがある
      expect(page).to have_content('LOGOUT')
      # サインアップページとログインページへ遷移するボタンがない
      expect(page).to have_no_content('SIGN UP')
      expect(page).to have_no_content('LOGIN')
    end
  end
end

RSpec.describe 'ユーザーログイン機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができる時' do
    it '保存されているユーザー情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログインボタンがある
      expect(page).to have_content('LOGIN')
      # ログインページへ遷移する
      visit new_user_session_path
      # 正しいユーザー情報を入力する
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq root_path
      # ログアウトボタンがある
      expect(page).to have_content('LOGOUT')
      # ログインボタンや新規登録ボタンは表示されていない
      expect(page).to have_no_content('SIGN UP')
      expect(page).to have_no_content('LOGIN')
    end
  end
end

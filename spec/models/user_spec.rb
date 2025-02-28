require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it'9つの項目が全て存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空では登録できない' do
        @user.email = '' 
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailには@が無ければ登録できない' do
        @user.email = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it '重複したメールアドレスは登録できない' do
        @user.save

        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'パスワードが空では保存できない' do
        @user.password = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードに全角が含まれると保存できない' do
        @user.password = '123aｓd'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end

      it 'パスワードが6文字未満では保存できない' do
        @user.password = '123ad'  
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must be at least 6 characters long")
      end

      it 'passwordとpassword_confirmationが一致しなければ保存できない' do
        @user.password_confirmation = 'differentpassword'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordは半角英字だけでは保存できない' do
        @user.password = 'aaaddd'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end

      it 'passwordは半角数字だけでは保存できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password must include both letters and numbers")
      end

      it 'last_nameが空では保存できない' do
        @user.last_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameに漢字、ひらがな、カタカナ以外の文字を含めて保存することはできない' do
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name must be in Kanji, Hiragana, or Katakana")
      end

      it 'first_nameが空では保存できない' do
        @user.first_name = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameに漢字、ひらがな、カタカナ以外の文字を含めて保存することはできない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name must be in Kanji, Hiragana, or Katakana")
      end

      it 'last_name_readが空では保存できない' do
        @user.last_name_read = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name read can't be blank")
      end

      it 'last_name_readにカタカナ以外の文字を含めて保存することはできない' do
        @user.last_name_read = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name read must be in Katakana")
      end

      it 'first_name_readが空では保存できない' do
        @user.first_name_read = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("First name read can't be blank")
      end

      it 'first_name_readにカタカナ以外の文字を含めて保存することはできない' do
        @user.first_name_read = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name read must be in Katakana")
      end

      it 'date_of_birthが空では保存できない' do
        @user.date_of_birth = ''  
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

    end
  end
end